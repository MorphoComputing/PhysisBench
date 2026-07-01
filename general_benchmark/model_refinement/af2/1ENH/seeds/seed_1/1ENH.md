# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1ENH\seeds\seed_1\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 0.875 A
- tm_score_ca_ordered: 0.9097095145601439
- heavy_atom_rmsd: 2.575 A
- sidechain_heavy_atom_rmsd: 3.131 A
- **all-atom quality (honest):** heavy 2.575 A, sidechain 3.131 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1225
- bin_accuracy: 0.842

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=1.1023284210633961 -> 0.6605227588931034 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.8752483506726065
- ga_delta_rmsd: -0.43056135312801513  ga_fitness_mode: energy
- pre_local_rmsd: 1.0283689671471008  localized_anchor_rmsd: 0.8752174870995328

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** P1 → 6 conflicts (86%)
- explained: 6/7 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.096), conflicts/hub=1.4, max_incompat=2.38Å, chain_span=0.096
- **fix-first:** [LOW_CONFLICT] Root cause(s): P1 — explain ~6/7 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q47** — severity 1.46, 2 conflict(s); suspect input ~`P1` (group: push_out)
  - push-out (wants farther): P1@19.5Å(now 15.4,conf 0.39), R2@16.6Å(now 12.9,conf 0.35)
  - I44↔P1: targets 5.6/19.5Å but partners are 11.8Å apart → too_close_together by 2.2Å
  - I44↔R2: targets 5.6/16.6Å but partners are 9.3Å apart → too_close_together by 1.7Å
- **R50** — severity 1.30, 2 conflict(s); suspect input ~`Q47` (group: push_out)
  - push-out (wants farther): P1@22.7Å(now 20.1,conf 0.48)
  - P1↔Q47: targets 22.7/5.7Å but partners are 15.4Å apart → too_close_together by 1.6Å
  - P1↔W45: targets 22.7/8.7Å but partners are 12.3Å apart → too_close_together by 1.7Å
- **A51** — severity 1.06, 1 conflict(s); suspect input ~`N48` (group: push_out)
  - push-out (wants farther): P1@21.7Å(now 18.9,conf 0.46)
  - P1↔N48: targets 21.7/5.5Å but partners are 13.9Å apart → too_close_together by 2.4Å
- **K49** — severity 0.60, 1 conflict(s); suspect input ~`W45` (group: push_out)
  - push-out (wants farther): P1@20.2Å(now 16.8,conf 0.41), R2@16.9Å(now 13.9,conf 0.35)
  - P1↔W45: targets 20.2/6.3Å but partners are 12.3Å apart → too_close_together by 1.5Å
- **K52** — severity 0.60, 1 conflict(s); suspect input ~`N48` (group: push_out)
  - push-out (wants farther): P1@21.7Å(now 19.0,conf 0.46)
  - P1↔N48: targets 21.7/6.3Å but partners are 13.9Å apart → too_close_together by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=11 · 3-10(G)=3 · coil(C)=0

```
EEGGEEHHHHHHHHHHHHHEHEEEHHHHHHHHHHEHEHHHHHHHHHHHGHHE
```

## Backbone H-bond Network

- total=27 · helix(i→i+4)=27 · sheet=0
  - S7 ↔ A11  (helix)
  - E8 ↔ R12  (helix)
  - Q9 ↔ L13  (helix)
  - L10 ↔ K14  (helix)
  - A11 ↔ R15  (helix)
  - R12 ↔ E16  (helix)
  - L13 ↔ F17  (helix)
  - K14 ↔ N18  (helix)
  - R15 ↔ E19  (helix)
  - F17 ↔ R21  (helix)
  - R21 ↔ E25  (helix)
  - E25 ↔ Q29  (helix)
  - R26 ↔ Q30  (helix)
  - R27 ↔ L31  (helix)
  - R28 ↔ S32  (helix)
  - Q29 ↔ S33  (helix)
  - Q30 ↔ E34  (helix)
  - S32 ↔ G36  (helix)
  - G36 ↔ A40  (helix)
  - E39 ↔ K43  (helix)
  - … +7 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=149 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=19 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1518 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
