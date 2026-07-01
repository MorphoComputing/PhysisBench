# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CSP\sequence\1CSP.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1CSP\seeds\seed_1\1CSP.pdb`
- residues: 65
- mode: oracle
- ca_rmsd: 2.733 A
- tm_score_ca_ordered: 0.7621692602605904
- heavy_atom_rmsd: 3.656 A
- sidechain_heavy_atom_rmsd: 4.356 A
- **all-atom quality (honest):** heavy 3.656 A, sidechain 4.356 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/52 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 1718
- bin_accuracy: 0.691

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.733170763910261
- ga_delta_rmsd: -0.580195603392295  ga_fitness_mode: energy
- pre_local_rmsd: 2.918370672202456  localized_anchor_rmsd: 2.7331681583274734

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L1-E2 → 1044 conflicts (100%)
- explained: 1044/1044 conflicts by 1 root cause(s)
- metrics: hubs=51 (frac 0.785), conflicts/hub=20.5, max_incompat=15.12Å, chain_span=0.938
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L1-E2 — explain ~1044/1044 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I17** — severity 91.31, 43 conflict(s); suspect input ~`F48` (group: push_out)
  - push-out (wants farther): E2@27.3Å(now 16.6,conf 0.92), L1@27.2Å(now 17.8,conf 0.90)
  - E2↔F48: targets 27.3/9.6Å but partners are 6.0Å apart → too_close_together by 11.7Å
  - L1↔F48: targets 27.2/9.6Å but partners are 6.8Å apart → too_close_together by 10.8Å
  - E2↔S47: targets 27.3/10.1Å but partners are 6.9Å apart → too_close_together by 10.3Å
- **V46** — severity 83.16, 31 conflict(s); suspect input ~`T63` (group: push_out)
  - push-out (wants farther): E2@27.2Å(now 9.0,conf 0.90), L1@25.9Å(now 10.3,conf 0.67)
  - E2↔T63: targets 27.2/5.8Å but partners are 7.2Å apart → too_close_together by 14.3Å
  - E2↔K64: targets 27.2/5.3Å but partners are 10.3Å apart → too_close_together by 11.6Å
  - E2↔V62: targets 27.2/6.6Å but partners are 7.2Å apart → too_close_together by 13.5Å
- **V5** — severity 77.87, 40 conflict(s); suspect input ~`V46` (group: push_out)
  - push-out (wants farther): E2@27.4Å(now 16.4,conf 0.95), L1@27.3Å(now 17.9,conf 0.93)
  - E2↔V46: targets 27.4/7.3Å but partners are 9.0Å apart → too_close_together by 11.1Å
  - L1↔V46: targets 27.3/7.3Å but partners are 10.3Å apart → too_close_together by 9.7Å
  - E2↔F48: targets 27.4/11.1Å but partners are 6.0Å apart → too_close_together by 10.3Å
- **V25** — severity 76.11, 38 conflict(s); suspect input ~`F48` (group: push_out)
  - push-out (wants farther): E2@27.1Å(now 17.1,conf 0.86), L1@27.1Å(now 17.8,conf 0.85)
  - E2↔A59: targets 27.1/6.6Å but partners are 10.8Å apart → too_close_together by 9.6Å
  - E2↔F48: targets 27.1/10.2Å but partners are 6.0Å apart → too_close_together by 10.9Å
  - L1↔F48: targets 27.1/10.2Å but partners are 6.8Å apart → too_close_together by 10.1Å
- **Q44** — severity 67.53, 34 conflict(s); suspect input ~`S47` (group: push_out)
  - push-out (wants farther): E2@27.5Å(now 15.7,conf 0.97), L1@27.4Å(now 17.2,conf 0.94)
  - E2↔S47: targets 27.5/10.1Å but partners are 6.9Å apart → too_close_together by 10.5Å
  - E2↔K64: targets 27.5/7.4Å but partners are 10.3Å apart → too_close_together by 9.7Å
  - E2↔T63: targets 27.5/10.1Å but partners are 7.2Å apart → too_close_together by 10.2Å
- **F16** — severity 67.07, 39 conflict(s); suspect input ~`F48` (group: push_out)
  - push-out (wants farther): L1@27.2Å(now 20.4,conf 0.89), E2@27.0Å(now 18.9,conf 0.84)
  - E2↔F48: targets 27.0/12.1Å but partners are 6.0Å apart → too_close_together by 8.9Å
  - L1↔F48: targets 27.2/12.1Å but partners are 6.8Å apart → too_close_together by 8.3Å
  - E2↔V62: targets 27.0/11.7Å but partners are 7.2Å apart → too_close_together by 8.2Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=25 · 3-10(G)=19 · coil(C)=6

```
EEGEGHEGGGHGGCEEGGGGHHHHEGGEHHGEEEHECHEGECHEHHCEEGHEEHGEEECEGGECE
```

## Backbone H-bond Network

- total=38 · helix(i→i+4)=0 · sheet=38
  - K4 ↔ G15  (sheet)
  - K4 ↔ F16  (sheet)
  - W7 ↔ G15  (sheet)
  - W7 ↔ F16  (sheet)
  - W7 ↔ V25  (sheet)
  - G15 ↔ V25  (sheet)
  - G15 ↔ H28  (sheet)
  - G15 ↔ I32  (sheet)
  - F16 ↔ V25  (sheet)
  - F16 ↔ H28  (sheet)
  - F16 ↔ I32  (sheet)
  - H28 ↔ Q33  (sheet)
  - H28 ↔ T39  (sheet)
  - I32 ↔ T39  (sheet)
  - I32 ↔ E41  (sheet)
  - I32 ↔ F48  (sheet)
  - I32 ↔ E49  (sheet)
  - I32 ↔ E52  (sheet)
  - Q33 ↔ T39  (sheet)
  - Q33 ↔ F48  (sheet)
  - … +18 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=256 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=166 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.1906 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 52 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1CSP.ensemble.pdb`)
- RMSF mean=0.135Å max=0.827Å (per-residue in .per_residue.csv)
- most flexible residues: 52, 22, 58, 23, 1

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1CSP.pae.csv`
- mean=0.085Å · max=0.884Å · AlphaFold-PAE analog (low block = rigid unit/domain)
