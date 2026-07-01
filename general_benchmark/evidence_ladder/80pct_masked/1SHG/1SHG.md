# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1SHG/sequence/1SHG.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1SHG/seeds/seed_1/1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 6.561 A
- tm_score_ca_ordered: 0.2169635045933915
- heavy_atom_rmsd: 7.566 A
- sidechain_heavy_atom_rmsd: 8.417 A
- **all-atom quality (honest):** heavy 7.566 A, sidechain 8.417 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 42
- distogram_pairs: 276
- bin_accuracy: 0.239

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.561252804981474
- ga_delta_rmsd: 0.2930349305405402  ga_fitness_mode: energy
- pre_local_rmsd: 6.561242918434021  localized_anchor_rmsd: 6.561242918434021

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q10-I24 → 104 conflicts (81%); D34-E39 → 12 conflicts (9%); L27-T31 → 7 conflicts (6%)
- explained: 123/128 conflicts by 3 root cause(s)
- metrics: hubs=42 (frac 0.764), conflicts/hub=3.0, max_incompat=9.03Å, chain_span=0.964
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q10-I24 + D34-E39 + L27-T31 — explain ~123/128 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A5** — severity 23.11, 9 conflict(s); suspect input ~`M19` (group: pull_in)
  - pull-in (wants closer): K20@6.5Å(now 10.9,conf 0.55), M19@7.0Å(now 9.9,conf 0.55)
  - push-out (wants farther): P14@19.6Å(now 9.9,conf 0.57), S13@18.5Å(now 11.9,conf 0.55), R15@17.7Å(now 13.6,conf 0.55), E16@14.3Å(now 10.1,conf 0.55)
  - P14↔M19: targets 19.6/7.0Å but partners are 3.6Å apart → too_close_together by 9.0Å
  - S13↔M19: targets 18.5/7.0Å but partners are 3.8Å apart → too_close_together by 7.7Å
  - R15↔M19: targets 17.7/7.0Å but partners are 4.2Å apart → too_close_together by 6.4Å
- **K21** — severity 21.91, 10 conflict(s); suspect input ~`L28` (group: push_out)
  - push-out (wants farther): N29@19.8Å(now 13.8,conf 0.58), S30@19.2Å(now 13.3,conf 0.56), L28@18.6Å(now 10.5,conf 0.55), W35@16.9Å(now 14.1,conf 0.55), P48@12.9Å(now 9.0,conf 0.55), E16@15.9Å(now 11.6,conf 0.55)
  - Y7↔L28: targets 4.5/18.6Å but partners are 7.6Å apart → too_close_together by 6.5Å
  - N29↔L6: targets 19.8/5.3Å but partners are 8.9Å apart → too_close_together by 5.6Å
  - L6↔L28: targets 5.3/18.6Å but partners are 7.6Å apart → too_close_together by 5.7Å
- **E11** — severity 19.32, 7 conflict(s); suspect input ~`L28` (group: pull_in)
  - pull-in (wants closer): E16@5.1Å(now 8.4,conf 0.57)
  - push-out (wants farther): L28@17.0Å(now 4.9,conf 0.55), E39@13.2Å(now 9.9,conf 0.55), M19@8.1Å(now 4.2,conf 0.55)
  - E16↔L28: targets 5.1/17.0Å but partners are 3.5Å apart → too_close_together by 8.4Å
  - V17↔L28: targets 5.0/17.0Å but partners are 3.7Å apart → too_close_together by 8.2Å
  - T18↔L28: targets 4.9/17.0Å but partners are 6.6Å apart → too_close_together by 5.5Å
- **L2** — severity 17.61, 8 conflict(s); suspect input ~`D23` (group: pull_in)
  - pull-in (wants closer): E39@9.6Å(now 13.7,conf 0.55)
  - push-out (wants farther): P14@22.5Å(now 11.4,conf 0.68), E16@17.8Å(now 9.3,conf 0.55)
  - P14↔D23: targets 22.5/10.0Å but partners are 5.1Å apart → too_close_together by 7.4Å
  - P14↔S30: targets 22.5/11.4Å but partners are 4.3Å apart → too_close_together by 6.8Å
  - P14↔W36: targets 22.5/11.8Å but partners are 5.3Å apart → too_close_together by 5.4Å
- **D34** — severity 15.98, 6 conflict(s); suspect input ~`P48` (group: pull_in)
  - pull-in (wants closer): P48@5.8Å(now 14.1,conf 0.55), K53@13.0Å(now 18.0,conf 0.55)
  - push-out (wants farther): R43@19.3Å(now 16.7,conf 0.56), D23@19.0Å(now 9.7,conf 0.56), E39@16.6Å(now 13.8,conf 0.55)
  - R43↔P48: targets 19.3/5.8Å but partners are 5.7Å apart → too_close_together by 7.8Å
  - D23↔P48: targets 19.0/5.8Å but partners are 5.5Å apart → too_close_together by 7.6Å
  - P48↔E39: targets 5.8/16.6Å but partners are 5.5Å apart → too_close_together by 5.2Å
- **T31** — severity 12.64, 6 conflict(s); suspect input ~`L28` (group: push_out)
  - push-out (wants farther): G22@22.6Å(now 18.4,conf 0.69), K20@22.3Å(now 15.7,conf 0.66), Q10@21.4Å(now 12.3,conf 0.61), I24@19.3Å(now 15.4,conf 0.56)
  - K20↔V47: targets 22.3/12.8Å but partners are 3.2Å apart → too_close_together by 6.2Å
  - K20↔V38: targets 22.3/11.9Å but partners are 6.4Å apart → too_close_together by 4.0Å
  - K20↔L28: targets 22.3/9.5Å but partners are 8.8Å apart → too_close_together by 3.9Å

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=17 · 3-10(G)=9 · coil(C)=2

```
EEHEHCEEEEHHEGGHHHHHGHHHHGHHHEGHHGGEGHEEHEHEHHHGEHHEEHC
```

## Backbone H-bond Network

- total=36 · helix(i→i+4)=15 · sheet=21
  - K12 ↔ E16  (helix)
  - E16 ↔ K20  (helix)
  - T18 ↔ G22  (helix)
  - M19 ↔ D23  (helix)
  - K20 ↔ I24  (helix)
  - D23 ↔ L27  (helix)
  - I24 ↔ L28  (helix)
  - L25 ↔ N29  (helix)
  - L28 ↔ N32  (helix)
  - N29 ↔ K33  (helix)
  - N41 ↔ G45  (helix)
  - R43 ↔ V47  (helix)
  - F46 ↔ A50  (helix)
  - V47 ↔ Y51  (helix)
  - A50 ↔ K54  (helix)
  - L2 ↔ Y7  (sheet)
  - L4 ↔ Y9  (sheet)
  - Y7 ↔ S13  (sheet)
  - D8 ↔ S13  (sheet)
  - Q10 ↔ S30  (sheet)
  - … +16 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=451 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=333 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.0058 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=42 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1SHG.ensemble.pdb`)
- RMSF mean=2.227Å max=5.676Å (per-residue in .per_residue.csv)
- most flexible residues: 33, 20, 1, 3, 14

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1SHG.pae.csv`
- mean=1.29Å · max=6.125Å · AlphaFold-PAE analog (low block = rigid unit/domain)
