# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1EGF\seeds\seed_1\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 0.600 A
- tm_score_ca_ordered: 0.9382737154238561
- heavy_atom_rmsd: 2.833 A
- sidechain_heavy_atom_rmsd: 3.714 A
- **all-atom quality (honest):** heavy 2.833 A, sidechain 3.714 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 1176
- bin_accuracy: 0.672

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.6000415211443398
- ga_delta_rmsd: 0.03430430251216099  ga_fitness_mode: energy
- pre_local_rmsd: 0.6115573422883873  localized_anchor_rmsd: 0.6000576622897621

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** H21 → 16 conflicts (40%); C32 → 10 conflicts (25%); L14 → 9 conflicts (22%)
- explained: 35/40 conflicts by 3 root cause(s)
- metrics: hubs=12 (frac 0.235), conflicts/hub=3.3, max_incompat=4.33Å, chain_span=0.902
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): H21 + C32 + L14 — explain ~35/40 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **H21** — severity 5.64, 7 conflict(s); suspect input ~`C41` (group: push_out)
  - pull-in (wants closer): C41@11.7Å(now 14.8,conf 0.34), S24@7.3Å(now 10.0,conf 0.36)
  - push-out (wants farther): G38@16.4Å(now 13.8,conf 0.35)
  - D45↔C41: targets 23.7/11.7Å but partners are 8.9Å apart → too_close_together by 3.1Å
  - R44↔C41: targets 20.4/11.7Å but partners are 5.9Å apart → too_close_together by 2.8Å
  - D39↔G38: targets 9.7/16.4Å but partners are 4.0Å apart → too_close_together by 2.6Å
- **C5** — severity 4.11, 5 conflict(s); suspect input ~`C32` (group: pull_in)
  - pull-in (wants closer): C32@11.8Å(now 14.6,conf 0.34)
  - V33↔C32: targets 19.7/11.8Å but partners are 3.7Å apart → too_close_together by 4.1Å
  - Y36↔C32: targets 19.7/11.8Å but partners are 5.6Å apart → too_close_together by 2.2Å
  - I34↔C32: targets 20.8/11.8Å but partners are 6.8Å apart → too_close_together by 2.1Å
- **L14** — severity 4.01, 5 conflict(s); suspect input ~`D45` (group: push_out)
  - pull-in (wants closer): L51@19.8Å(now 22.5,conf 0.40), D45@10.9Å(now 13.4,conf 0.34)
  - push-out (wants farther): L46@18.6Å(now 16.0,conf 0.37)
  - L46↔D45: targets 18.6/10.9Å but partners are 4.0Å apart → too_close_together by 3.8Å
  - Y36↔L46: targets 8.8/18.6Å but partners are 6.8Å apart → too_close_together by 3.0Å
  - G35↔L46: targets 12.1/18.6Å but partners are 4.8Å apart → too_close_together by 1.8Å
- **C41** — severity 3.67, 5 conflict(s); suspect input ~`H21` (group: pull_in)
  - pull-in (wants closer): H21@11.7Å(now 14.8,conf 0.34)
  - P3↔H21: targets 19.3/11.7Å but partners are 4.8Å apart → too_close_together by 2.9Å
  - H21↔G35: targets 11.7/7.1Å but partners are 21.4Å apart → too_far_apart by 2.6Å
  - R44↔H21: targets 6.4/11.7Å but partners are 20.2Å apart → too_far_apart by 2.0Å
- **G35** — severity 3.53, 3 conflict(s); suspect input ~`E50` (group: push_out)
  - push-out (wants farther): L51@19.4Å(now 16.5,conf 0.39)
  - E50↔L51: targets 11.6/19.4Å but partners are 3.5Å apart → too_close_together by 4.3Å
  - W48↔L51: targets 7.4/19.4Å but partners are 8.4Å apart → too_close_together by 3.5Å
  - L51↔W49: targets 19.4/10.5Å but partners are 6.6Å apart → too_close_together by 2.3Å
- **S24** — severity 2.64, 3 conflict(s); suspect input ~`M20` (group: pull_in)
  - pull-in (wants closer): H21@7.3Å(now 10.0,conf 0.36)
  - H21↔M20: targets 7.3/14.5Å but partners are 3.8Å apart → too_close_together by 3.4Å
  - C5↔H21: targets 15.7/7.3Å but partners are 5.8Å apart → too_close_together by 2.6Å
  - H21↔C19: targets 7.3/16.2Å but partners are 7.2Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=24 · 3-10(G)=4 · coil(C)=10

```
EECEGEHHECCGCEHCEECEEEHHHHECEGEEECHEEEHEHHHHECEGEEC
```

## Backbone H-bond Network

- total=84 · helix(i→i+4)=2 · sheet=82
  - G35 ↔ D39  (helix)
  - D39 ↔ T43  (helix)
  - S1 ↔ M20  (sheet)
  - S1 ↔ H21  (sheet)
  - Y2 ↔ M20  (sheet)
  - Y2 ↔ H21  (sheet)
  - Y2 ↔ I22  (sheet)
  - G4 ↔ Y9  (sheet)
  - G4 ↔ V18  (sheet)
  - G4 ↔ M20  (sheet)
  - G4 ↔ H21  (sheet)
  - G4 ↔ I22  (sheet)
  - P6 ↔ M20  (sheet)
  - P6 ↔ H21  (sheet)
  - Y9 ↔ L14  (sheet)
  - Y9 ↔ H21  (sheet)
  - Y9 ↔ S27  (sheet)
  - Y9 ↔ T29  (sheet)
  - L14 ↔ T29  (sheet)
  - L14 ↔ N31  (sheet)
  - … +64 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=183 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=99 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.11 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
