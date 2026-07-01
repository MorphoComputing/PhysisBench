# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_fused\1JRJ\seeds\seed_0\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.274 A
- tm_score_ca_ordered: 0.3243993103243212
- heavy_atom_rmsd: 5.540 A
- sidechain_heavy_atom_rmsd: 7.201 A
- **all-atom quality (honest):** heavy 5.540 A, sidechain 7.201 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 155
- bin_accuracy: 0.665

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** K26 → 8 conflicts (62%)
- explained: 8/13 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.135), conflicts/hub=2.6, max_incompat=4.82Å, chain_span=0.622
- **fix-first:** [LOW_CONFLICT] Root cause(s): K26 — explain ~8/13 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I22** — severity 10.80, 5 conflict(s); suspect input ~`K26` (group: pull_in)
  - pull-in (wants closer): R19@5.0Å(now 8.0,conf 0.70), K26@6.1Å(now 10.1,conf 0.70)
  - T4↔K26: targets 27.8/6.1Å but partners are 38.0Å apart → too_far_apart by 4.1Å
  - S7↔K26: targets 23.4/6.1Å but partners are 32.9Å apart → too_far_apart by 3.5Å
  - G28↔K26: targets 10.2/6.1Å but partners are 0.7Å apart → too_close_together by 3.4Å
- **E23** — severity 5.21, 2 conflict(s); suspect input ~`K26` (group: pull_in)
  - pull-in (wants closer): G1@38.0Å(now 40.7,conf 0.89)
  - G1↔K26: targets 38.0/5.1Å but partners are 47.9Å apart → too_far_apart by 4.8Å
  - G1↔N27: targets 38.0/6.1Å but partners are 47.2Å apart → too_far_apart by 3.0Å
- **W24** — severity 4.98, 3 conflict(s); suspect input ~`P30` (group: push_out)
  - pull-in (wants closer): G3@33.3Å(now 35.9,conf 0.85)
  - push-out (wants farther): P37@7.2Å(now 3.8,conf 0.55)
  - G3↔P30: targets 33.3/5.4Å but partners are 42.2Å apart → too_far_apart by 3.5Å
  - G3↔N27: targets 33.3/5.4Å but partners are 40.8Å apart → too_far_apart by 2.0Å
  - G3↔S31: targets 33.3/10.2Å but partners are 45.3Å apart → too_far_apart by 1.8Å
- **T6** — severity 3.02, 2 conflict(s); suspect input ~`G1` (group: pull_in)
  - pull-in (wants closer): K26@31.4Å(now 35.0,conf 0.82)
  - K26↔G1: targets 31.4/14.1Å but partners are 47.9Å apart → too_far_apart by 2.5Å
  - K26↔E2: targets 31.4/11.3Å but partners are 45.1Å apart → too_far_apart by 2.4Å
- **G1** — severity 1.58, 1 conflict(s); suspect input ~`E23` (group: pull_in)
  - pull-in (wants closer): E23@38.0Å(now 40.7,conf 0.89)
  - G28↔E23: targets 47.5/38.0Å but partners are 7.7Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=12 · 3-10(G)=3 · coil(C)=0

```
EEEEHHHHHHHHHEHEGHHEGHGHEHHHHHHEHEEHE
```

## Backbone H-bond Network

- total=20 · helix(i→i+4)=11 · sheet=9
  - F5 ↔ L9  (helix)
  - T6 ↔ S10  (helix)
  - S7 ↔ K11  (helix)
  - L9 ↔ M13  (helix)
  - K11 ↔ E15  (helix)
  - E15 ↔ R19  (helix)
  - V18 ↔ I22  (helix)
  - I22 ↔ K26  (helix)
  - W24 ↔ G28  (helix)
  - N27 ↔ S31  (helix)
  - G29 ↔ G33  (helix)
  - E14 ↔ L20  (sheet)
  - L20 ↔ L25  (sheet)
  - L20 ↔ P35  (sheet)
  - L20 ↔ P37  (sheet)
  - L25 ↔ S32  (sheet)
  - L25 ↔ A34  (sheet)
  - L25 ↔ P35  (sheet)
  - L25 ↔ P37  (sheet)
  - S32 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=111 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=15 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9977 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
