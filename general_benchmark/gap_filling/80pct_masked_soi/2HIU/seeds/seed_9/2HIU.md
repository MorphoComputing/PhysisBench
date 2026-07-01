# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2HIU\seeds\seed_9\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 3.561 A
- tm_score_ca_ordered: 0.4997978228346072
- heavy_atom_rmsd: 5.017 A
- sidechain_heavy_atom_rmsd: 5.837 A
- **all-atom quality (honest):** heavy 5.017 A, sidechain 5.837 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 367
- bin_accuracy: 0.531

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.5610787360580707
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 3.659326562147958  localized_anchor_rmsd: 3.5611168421385293

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** S11-Q22 → 6 conflicts (100%)
- explained: 6/6 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.106), conflicts/hub=1.2, max_incompat=1.98Å, chain_span=0.766
- **fix-first:** [LOW_CONFLICT] Root cause(s): S11-Q22 — explain ~6/6 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q14** — severity 1.70, 2 conflict(s); suspect input ~`Q22` (group: push_out)
  - push-out (wants farther): N17@9.2Å(now 5.3,conf 0.82), V20@9.6Å(now 4.1,conf 0.69), S8@15.1Å(now 12.5,conf 0.58), N21@11.0Å(now 4.1,conf 0.55), Q22@12.1Å(now 6.7,conf 0.55)
  - S11↔Q22: targets 5.1/12.1Å but partners are 5.4Å apart → too_close_together by 1.6Å
  - S11↔N21: targets 5.1/11.0Å but partners are 4.3Å apart → too_close_together by 1.6Å
- **F43** — severity 1.08, 1 conflict(s); suspect input ~`P46` (group: push_out)
  - pull-in (wants closer): C19@7.1Å(now 12.4,conf 0.55)
  - push-out (wants farther): V36@9.9Å(now 5.4,conf 0.49)
  - C19↔P46: targets 7.1/9.3Å but partners are 18.4Å apart → too_far_apart by 2.0Å
- **H28** — severity 1.03, 1 conflict(s); suspect input ~`N17` (group: push_out)
  - push-out (wants farther): N17@16.2Å(now 12.3,conf 0.55)
  - A32↔N17: targets 5.8/16.2Å but partners are 8.4Å apart → too_close_together by 1.9Å
- **S8** — severity 0.96, 1 conflict(s); suspect input ~`L15` (group: push_out)
  - push-out (wants farther): Y13@16.0Å(now 13.2,conf 0.72), Q14@15.1Å(now 12.5,conf 0.58)
  - Y13↔L15: targets 16.0/12.5Å but partners are 1.7Å apart → too_close_together by 1.8Å
- **Y44** — severity 0.95, 1 conflict(s); suspect input ~`N17` (group: push_out)
  - pull-in (wants closer): N17@9.1Å(now 13.8,conf 0.55)
  - push-out (wants farther): A32@11.9Å(now 8.5,conf 0.55)
  - K47↔N17: targets 9.4/9.1Å but partners are 20.3Å apart → too_far_apart by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=15 · 3-10(G)=4 · coil(C)=4

```
CHHEHHHHHHGHHHHEHHGEHEEHHEGEHCHHEHEHCEHEHCEGEEE
```

## Backbone H-bond Network

- total=36 · helix(i→i+4)=12 · sheet=24
  - V2 ↔ C6  (helix)
  - C5 ↔ I9  (helix)
  - C6 ↔ C10  (helix)
  - S8 ↔ L12  (helix)
  - I9 ↔ Y13  (helix)
  - C10 ↔ Q14  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - N17 ↔ N21  (helix)
  - N21 ↔ C25  (helix)
  - C25 ↔ L29  (helix)
  - A32 ↔ V36  (helix)
  - Q4 ↔ Q22  (sheet)
  - Q4 ↔ H23  (sheet)
  - E16 ↔ Q22  (sheet)
  - E16 ↔ H23  (sheet)
  - E16 ↔ L33  (sheet)
  - E16 ↔ L35  (sheet)
  - Q22 ↔ H28  (sheet)
  - H23 ↔ H28  (sheet)
  - … +16 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=178 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=69 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0416 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
