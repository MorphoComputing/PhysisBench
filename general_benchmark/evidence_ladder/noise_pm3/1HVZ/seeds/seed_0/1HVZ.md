# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1HVZ\seeds\seed_0\1HVZ.pdb`
- residues: 16
- mode: oracle
- ca_rmsd: 4.151 A
- tm_score_ca_ordered: 0.10164897028528809
- heavy_atom_rmsd: 6.360 A
- sidechain_heavy_atom_rmsd: 7.906 A
- **all-atom quality (honest):** heavy 6.360 A, sidechain 7.906 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.062
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 91
- bin_accuracy: 0.374

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=9
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.151389024795099
- ga_delta_rmsd: -1.6513061916419107  ga_fitness_mode: energy
- pre_local_rmsd: 4.151448798031797  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C11 → 11 conflicts (58%); C2 → 4 conflicts (21%)
- explained: 15/19 conflicts by 2 root cause(s)
- metrics: hubs=7 (frac 0.438), conflicts/hub=2.7, max_incompat=6.47Å, chain_span=0.875
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C11 + C2 — explain ~15/19 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C2** — severity 4.27, 6 conflict(s); suspect input ~`C11` (group: push_out)
  - push-out (wants farther): C15@7.9Å(now 4.5,conf 0.23), G9@21.7Å(now 17.7,conf 0.29), R8@22.7Å(now 15.9,conf 0.34)
  - R8↔C11: targets 22.7/9.8Å but partners are 6.5Å apart → too_close_together by 6.5Å
  - R8↔L5: targets 22.7/8.2Å but partners are 9.7Å apart → too_close_together by 4.8Å
  - G9↔C11: targets 21.7/9.8Å but partners are 6.8Å apart → too_close_together by 5.1Å
- **R8** — severity 2.56, 2 conflict(s); suspect input ~`C2` (group: push_out)
  - push-out (wants farther): C2@22.7Å(now 15.9,conf 0.34), I14@17.9Å(now 15.1,conf 0.18)
  - C2↔C11: targets 22.7/5.6Å but partners are 11.2Å apart → too_close_together by 5.9Å
  - I14↔C11: targets 17.9/5.6Å but partners are 9.1Å apart → too_close_together by 3.2Å
- **C11** — severity 2.51, 4 conflict(s); suspect input ~`T16` (group: push_out)
  - push-out (wants farther): T16@18.5Å(now 13.2,conf 0.19)
  - I14↔T16: targets 8.5/18.5Å but partners are 5.3Å apart → too_close_together by 4.7Å
  - C2↔T16: targets 9.8/18.5Å but partners are 3.9Å apart → too_close_together by 4.9Å
  - L5↔T16: targets 5.6/18.5Å but partners are 10.0Å apart → too_close_together by 2.8Å
- **I14** — severity 1.16, 2 conflict(s); suspect input ~`R7` (group: push_out)
  - push-out (wants farther): R8@17.9Å(now 15.1,conf 0.18)
  - R7↔R8: targets 10.0/17.9Å but partners are 3.9Å apart → too_close_together by 4.0Å
  - R8↔C11: targets 17.9/8.5Å but partners are 6.5Å apart → too_close_together by 2.9Å
- **T16** — severity 1.02, 2 conflict(s); suspect input ~`R12` (group: push_out)
  - push-out (wants farther): V10@19.3Å(now 16.1,conf 0.21), C11@18.5Å(now 13.2,conf 0.19)
  - R12↔C11: targets 9.8/18.5Å but partners are 4.5Å apart → too_close_together by 4.2Å
  - C13↔C11: targets 9.9/18.5Å but partners are 6.5Å apart → too_close_together by 2.1Å
- **V10** — severity 0.99, 2 conflict(s); suspect input ~`R3` (group: pull_in)
  - pull-in (wants closer): R3@8.7Å(now 11.7,conf 0.19)
  - push-out (wants farther): F1@17.2Å(now 13.5,conf 0.17), T16@19.3Å(now 16.1,conf 0.21)
  - T16↔R3: targets 19.3/8.7Å but partners are 7.8Å apart → too_close_together by 2.7Å
  - C15↔R3: targets 17.9/8.7Å but partners are 6.5Å apart → too_close_together by 2.6Å

## Secondary Structure (DSSP-like)

- helix(H)=7 · strand(E)=6 · 3-10(G)=1 · coil(C)=2

```
CEEHHHEEHGEHHCHE
```

## Backbone H-bond Network

- total=7 · helix(i→i+4)=2 · sheet=5
  - L5 ↔ G9  (helix)
  - G9 ↔ C13  (helix)
  - C2 ↔ R7  (sheet)
  - C2 ↔ C11  (sheet)
  - C2 ↔ T16  (sheet)
  - R3 ↔ C11  (sheet)
  - R3 ↔ T16  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=39 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=19 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7626 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0625

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
- Ramachandran forbidden fraction exceeds 5%.
